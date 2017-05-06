import base64
'''
用于简易加密
'''
def encrypt(text):
    # 简易加密
    try:
        bytesString = text.encode(encoding="utf-8")
        encodestr = base64.b64encode(bytesString)
        return encodestr.decode()
    except:
        return ''

def encrypt_dict(data):
    for key in data:
        data[key] = encrypt(data[key])

    return data

def deciphering(text):
    try:
        return base64.b64decode(text).decode()
    except:
        return ''


def deciphering_dict(data):
    for key in data:
        data[key] = deciphering(data[key])

    return data