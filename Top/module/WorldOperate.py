import docx
import os

def readDocx(docName):
    #由调用者去处理错误
    if not os.path.exists(docName):
        return ''
    fullText = []
    doc = docx.Document(docName)
    paras = doc.paragraphs
    for p in paras:
        fullText.append(p.text)
    return ''.join(fullText)

def WriteDocx(docName):
    pass