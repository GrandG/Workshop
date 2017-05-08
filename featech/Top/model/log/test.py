import pymysql

conn = pymysql.connect(host='127.0.0.1', port=3306,
                                         user='root', passwd='616311401', db='ids',
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)

cur = conn.cursor()
SQL = 'SELECT * FROM general_info'
# SQL = 'select name from general_info where type="S_DFRLIB"'
cur.execute(SQL)
res = cur.fetchall()
print(res)


# from module.g_Top import g_DB
#
# SQL = 'select name from general_info where type="S_DFRLIB"'
# g_DB.connect(host='localhost', user='root', password='616311401', db='test')
# res = g_DB.ExecuteAndReturn(SQL)
# for d in res:
#     print(d.get('name', ''))
