package com.weirq.test;

import java.awt.Graphics;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import java.awt.image.IndexColorModel;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

import org.icepdf.core.exceptions.PDFException;
import org.icepdf.core.exceptions.PDFSecurityException;
import org.icepdf.core.pobjects.Document;
import org.icepdf.core.pobjects.PDimension;
import org.icepdf.core.pobjects.Page;
import org.icepdf.core.util.GraphicsRenderingHints;

public class PdfToTif {
	public static final double PRINTER_RESOLUTION = 300.0;
	public static final String COMPRESSION_TYPE = "CCITT T.6";

	public static void main(String[] args) throws FileNotFoundException,
			PDFSecurityException, IOException {
		PdfToTif t = new PdfToTif();
		String toPdfPath = "E:/工作/";
		String topdfName = "陈志凯的交接文档.pdf";
		String tohterPath = "E:/工作/";
		// boolean t2 = t.icepdf_PDFtotif_single(toPdfPath + topdfName,
		// topdfName,tohterPath);
		try {
			boolean t3 = t.icepdf_PDFtotif_join(toPdfPath + topdfName,
					topdfName, tohterPath);
		} catch (PDFException e) {
			e.printStackTrace();
		}
		System.out.println("ok");
	}

	/**
	 * 
	 * 方法说明：转换成单个tif PDF转换成tif格式，单页转换 filePath 源文件路径 tfilePath 目标文件夹 返回boolen
	 * true or false
	 */

	private boolean icepdf_PDFtotif_single(String filePath, String filename,
			String tfilePath) throws PDFSecurityException,
			FileNotFoundException, IOException {
		Document document = new Document();
		System.out.println("===开始转换文件：" + filename + "  开始时间："
				+ this.getCurrentDate("yyyy/MM/dd/-HH:mm:ss"));
		try {
			document.setFile(filePath);
		} catch (PDFException e1) {
			e1.printStackTrace();
		}
		try {
			if (filename.indexOf(".") > -1) {
				filename = filename.substring(0, filename.indexOf("."));
			} else {
				filename = filename;
			}
			for (int i = 0; i < document.getNumberOfPages(); i++) {
				int j = i + 1;
				String NewJpePagesName = filename + "_" + j + "_.tif";
				File file = new File(tfilePath + NewJpePagesName);
				if (!file.getParentFile().exists()) {
					file.getParentFile().mkdirs();
				}
				System.out.println("Output file location " + file);
				ImageOutputStream ios = ImageIO.createImageOutputStream(file);
				Iterator<ImageWriter> writers = ImageIO
						.getImageWritersByFormatName("tif");
				ImageWriter writer = null;
				if (writers.hasNext()) {
					writer = writers.next();
				}
				// ImageWriter writer = writers.next();
				// ImageWriter writer =
				// ImageIO.getImageWritersByFormatName("tiff").next();
				writer.setOutput(ios);

				final double targetDPI = PRINTER_RESOLUTION;
				float scale = 1.0f;
				float rotation = 0f;
				PDimension size = document.getPageDimension(i, rotation, scale);
				double dpi = Math.sqrt((size.getWidth() * size.getWidth())
						+ (size.getHeight() * size.getHeight()))
						/ Math.sqrt((8.5 * 8.5) + (11 * 11));
				if (dpi < (targetDPI - 0.1)) {
					scale = (float) (targetDPI / dpi);
					size = document.getPageDimension(i, rotation, scale);
				}
				int pageWidth = (int) size.getWidth();
				int pageHeight = (int) size.getHeight();
				int[] cmap = new int[] { 0xFF000000, 0xFFFFFFFF };
				IndexColorModel cm = new IndexColorModel(1, cmap.length, cmap,
						0, false, Transparency.OPAQUE, DataBuffer.TYPE_BYTE);
				BufferedImage image = new BufferedImage(pageWidth, pageHeight,
						BufferedImage.TYPE_BYTE_BINARY, cm);
				Graphics g = image.createGraphics();
				document.paintPage(i, g, GraphicsRenderingHints.PRINT,
						Page.BOUNDARY_CROPBOX, rotation, scale);
				g.dispose();
				IIOImage img = new IIOImage(image, null, null);
				ImageWriteParam param = writer.getDefaultWriteParam();
				param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
				param.setCompressionType(COMPRESSION_TYPE);
				writer.write(null, img, param);
				image.flush();
				ios.flush();
				ios.close();
				writer.dispose();
				System.out
						.println("PDF converted to Tiff successfully with compression type "
								+ COMPRESSION_TYPE + NewJpePagesName);
			}
			System.out.println("===结束转换文件：" + filename + "  结束时间："
					+ this.getCurrentDate("yyyy/MM/dd/-HH:mm:ss"));
		} catch (IOException e) {
			System.out.println("Error saving file " + e);
			e.printStackTrace();
			return false;
		}
		document.dispose();
		return true;
	}

	/**
	 * 
	 * 方法说明：转换集合个tif PDF转换成tif格式，单页转换 filePath 源文件路径 tfilePath 目标文件夹 返回boolen
	 * true or false
	 */

	private boolean icepdf_PDFtotif_join(String filePath, String filename,
			String tfilePath) throws PDFException, PDFSecurityException,
			FileNotFoundException, IOException {
		Document document = new Document();
		System.out.println("===开始转换文件：" + filename + "  开始时间："
				+ this.getCurrentDate("yyyy/MM/dd/-HH:mm:ss"));
		document.setFile(filePath);
		try {
			if (filename.indexOf(".") > -1) {
				filename = filename.substring(0, filename.indexOf("."));
			} else {
				filename = filename;
			}
			String NewJpePagesName = filename + "_"
					+ this.getCurrentDate("yyyyMMssHHmmss") + ".tif";
			File file = new File(tfilePath + NewJpePagesName);
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			System.out.println("Output file location " + file);
			ImageOutputStream ios = ImageIO.createImageOutputStream(file);
			ImageWriter writer = ImageIO.getImageWritersByFormatName("TIF")
					.next();
			writer.setOutput(ios);

			for (int i = 0; i < document.getNumberOfPages(); i++) {
				final double targetDPI = PRINTER_RESOLUTION;
				float scale = 1.0f;
				float rotation = 0f;
				PDimension size = document.getPageDimension(i, rotation, scale);
				double dpi = Math.sqrt((size.getWidth() * size.getWidth())
						+ (size.getHeight() * size.getHeight()))
						/ Math.sqrt((8.5 * 8.5) + (11 * 11));
				if (dpi < (targetDPI - 0.1)) {
					scale = (float) (targetDPI / dpi);
					size = document.getPageDimension(i, rotation, scale);
				}
				int pageWidth = (int) size.getWidth();
				int pageHeight = (int) size.getHeight();
				int[] cmap = new int[] { 0xFF000000, 0xFFFFFFFF };
				IndexColorModel cm = new IndexColorModel(1, cmap.length, cmap,
						0, false, Transparency.OPAQUE, DataBuffer.TYPE_BYTE);
				BufferedImage image = new BufferedImage(pageWidth, pageHeight,
						BufferedImage.TYPE_BYTE_BINARY, cm);
				Graphics g = image.createGraphics();
				document.paintPage(i, g, GraphicsRenderingHints.PRINT,
						Page.BOUNDARY_CROPBOX, rotation, scale);
				g.dispose();
				IIOImage img = new IIOImage(image, null, null);
				ImageWriteParam param = writer.getDefaultWriteParam();
				param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
				param.setCompressionType(COMPRESSION_TYPE);
				if (i == 0) {
					writer.write(null, img, param);
				} else {
					writer.writeInsert(-1, img, param);
				}
				image.flush();
			}

			ios.flush();
			ios.close();
			writer.dispose();
			System.out
					.println("PDF converted to Tiff successfully with compression type "
							+ COMPRESSION_TYPE);
			System.out.println("===结束转换文件：" + filename + "  结束时间："
					+ this.getCurrentDate("yyyy/MM/dd/-HH:mm:ss"));
		} catch (IOException e) {
			System.out.println("Error saving file " + e);
			e.printStackTrace();
			return false;
		}
		document.dispose();
		return true;
	}

	public String getCurrentDate(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		Date today = new Date();
		String tString = df.format(today);
		return tString;
	}
}
