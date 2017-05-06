#!/usr/bin/python3
# coding: utf-8
"""PDF parser for pdfminer3k.

File name: pdf_parser3k.py
Author: Miles Yao
Version:
Date: 2017/4/21

Description:
    PDFMiner3k version: 1.3.1

Class List:
    1.

Function List:
    1.

History:
    <author>    <time>      <version >  <desc>
    miles       2017/4/21   0.1          build this module

"""
from pdfminer.converter import PDFPageAggregator
from pdfminer.layout import LAParams, LTTextBoxHorizontal
from pdfminer.pdfinterp import (PDFPageInterpreter, PDFResourceManager,
                                PDFTextExtractionNotAllowed)
from pdfminer.pdfparser import PDFDocument, PDFParser


# pdf file parser and analyzer ********************


def ReadPDF(pdf_path, password=''):
    """提取 PDF 文本内容, 输出为 str.

    maxpages = 0
    caching = True
    pagenos = set()
    """
    try:
        fp = open(pdf_path, 'rb')
        parser = PDFParser(fp)
        document = PDFDocument()

        # Connect the parser and document objects
        parser.set_document(document)
        document.set_parser(parser)

        # Supply the password for initialization (or empty string)
        document.initialize(password)

        if not document.is_extractable:
            raise PDFTextExtractionNotAllowed

        rsrcmgr = PDFResourceManager()
        laparams = LAParams()
        device = PDFPageAggregator(rsrcmgr, laparams=laparams)
        interpreter = PDFPageInterpreter(rsrcmgr, device)

        text_content = []

        # process each page contained in the document
        for page in document.get_pages():
            interpreter.process_page(page)
            layout = device.get_result()
            for layo in layout:
                if (isinstance(layo, LTTextBoxHorizontal)):
                    text_content.append(layo.get_text())

        device.close()
    except IOError as e:
        # error
        pass
    return text_content


if __name__ == '__main__':
    print(ReadPDF('f:/test/2.pdf'))
