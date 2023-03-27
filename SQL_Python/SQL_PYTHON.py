import psycopg2

# # Создание БД "our_clientsdb"
# def create_db():
#     conn = psycopg2.connect(
#         host="localhost",
#         database="postgres",
#         user="postgres",
#         password="mypassword"
#     )
#     cur = conn.cursor()
#     cur.execute("""CREATE DATABASE our_clientsdb""")
#     conn.commit()
#     conn.close()
#
#
# # Подключение к базе данных
# def connect_db():
#     conn = psycopg2.connect(dbname='our_clientdb', user='postgres', password='4041978')
#     conn.autocommit = True
#     return conn
#
#

# def create_table():
#     conn = connect_db()
#     cur = conn.cursor()
#     cur.execute("""
#     CREATE TABLE clients (
#     id SERIAL PRIMARY KEY,
#     first_name VARCHAR(50) NOT NULL,
#     last_name VARCHAR(50) NOT NULL,
#     email VARCHAR(100),
#     phone_numbers VARCHAR ARRAY
#     );
#     """)
#     conn.commit()
#     conn.close()
#
#
#
# # Функция, позволяющая добавить нового клиента.
# def add_client(first_name, last_name, email, phone_numbers):
#     conn = connect_db()
#     with conn.cursor() as cur:
#         cur.execute("""INSERT INTO clients (first_name, last_name, email, phone_numbers)
#                     VALUES (%s, %s, %s, %s)""",
#                     (first_name, last_name, email, phone_numbers))
#         conn.commit()
#         # Закрываем соединение с БД
#     conn.close()
#
#
# # Функция, позволяющая изменить данные о клиенте.
# def update_client(id, first_name, last_name, email, phone_numbers):
#     conn = connect_db()
#     with conn.cursor() as cur:
#         cur.execute("""UPDATE clients SET first_name = %s, last_name = %s, email = %s, phone_numbers = %s
#                     WHERE id = %s""",
#                     (first_name, last_name, email, phone_numbers, id))
#         conn.commit()
#         # Закрываем соединение с БД
#     conn.close()
#
#
# # Функция, позволяющая удалить телефон для существующего клиента.
# def delete_fone(id):
#     conn = connect_db()
#     with conn.cursor() as cur:
#         cur.execute("""DELETE fone_numbers FROM clients WHERE id = %s, """, (id))
#         conn.commit()
#         # Закрываем соединение с БД
#     conn.close()
#
# # Функция, позволяющая удалить существующего клиента.
# def delete_client(id):
#     conn = connect_db()
#     with conn.cursor() as cur:
#         cur.execute("""DELETE FROM clients WHERE id = %s""", (id))
#         conn.commit()
#         # Закрываем соединение с БД
#     conn.close()
#
# # Функция, позволяющая найти клиента по его данным: имени, фамилии, email или телефону.
# def find_client():
#     conn = connect_db()
#     with conn.cursor() as cur:
#         cur.execute("""SELECT * FROM clients WHERE first_name = %s OR last_name = %s OR email = %s OR phone_numbers = %s""",
#                     (first_name, last_name, email, phone_numbers))
#         conn.commit()
#         # Закрываем соединение с БД
#     conn.close()
#
# # Функция, позволяющая получить всех клиентов из БД.
# def get_all_clients():
#     conn = connect_db()
#     with conn.cursor() as cur:
#         cur.execute("""SELECT * FROM clients""")
#         rows = cur.fetchall()
#         conn.commit()
#         # Закрываем соединение с БД
#     conn.close()
#     return rows
#
# # Функция выводит всех клиентов у кого отсутствует телефон.
# def get_all_clients_without_fone():
#     conn = connect_db()
#     with conn.cursor() as cur:
#         cur.execute("""SELECT * FROM clients WHERE phone_numbers IS NULL""")
#         rows = cur.fetchall()  # Получаем результаты
#         conn.commit()
#     # Закрываем соединение с БД
#     conn.close()
#     return rows


# код, демонстрирующий работу всех написанных функций.
# if __name__ == '__main__':
    # create_table()
    # add_client('Иван', 'Иванов', 'Иванович', ['+7(903)123-45-67', '+7(903)123-45-67'])
    # add_client('Петр', 'Петров', 'Петрович', ['+7(903)123-45-67', '+7(903)123-45-67'])
    # add_client('Сергей', 'Сергеев', 'Сергеевич', ['+7(903)123-45-67', '+7(903)123-45-67'])
    # update_client(1, 'Иван', 'Иванов', 'Иванович', ['+7(903)123-45-67', '+7(903)123-45-67'])
    # delete_client(1)
    # delete_fone()
    # find_client()
    # print(get_all_clients())



class Client:
    def __init__(self, first_name, last_name, email, phone_numbers):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.phone_numbers = phone_numbers

    def connect_db(self):
        conn = psycopg2.connect(dbname='your_name_db', user='postgres', password='your_password')
        conn.autocommit = True
        return conn

    def add_client(self):
        conn = self.connect_db()
        with conn.cursor() as cur:
            cur.execute("""INSERT INTO clients (first_name, last_name, email, phone_numbers) VALUES (%s, %s, %s, %s)""",
                        (self.first_name, self.last_name, self.email, self.phone_numbers))
        conn.close()

    def update_client(self, id, first_name, last_name, email, phone_numbers):
        conn = self.connect_db()
        with conn.cursor() as cur:
            cur.execute("""UPDATE clients SET first_name = %s, last_name = %s, email = %s, phone_numbers = %s WHERE id = %s""",
                        (first_name, last_name, email, phone_numbers, id))
        conn.close()

    def delete_client(self, id):
        conn = self.connect_db()
        with conn.cursor() as cur:
            cur.execute("""DELETE FROM clients WHERE id = %s""", (id,))
        conn.close()



    def find_client(self, first_name=None, last_name=None, email=None, phone_numbers=None):
        conn = self.connect_db()
        with conn.cursor() as cur:
            cur.execute(
                """SELECT * FROM clients 
                   WHERE (LOWER(first_name) = LOWER(%s) OR %s IS NULL) 
                         AND (LOWER(last_name) = LOWER(%s) OR %s IS NULL) 
                         AND (LOWER(email) = LOWER(%s) OR %s IS NULL) 
                         AND (%s = ANY(phone_numbers) OR %s IS NULL)""",
                (first_name, first_name, last_name, last_name, email, email, phone_numbers, phone_numbers))

            results = cur.fetchall()
        conn.close()
        return results


    def get_all_clients(self):
        conn = self.connect_db()
        with conn.cursor() as cur:
            cur.execute("""SELECT * FROM clients""")
            rows = cur.fetchall()
        conn.close()
        return rows

    def get_all_clients_without_fone(self):
        conn = self.connect_db()
        with conn.cursor() as cur:
            cur.execute("""SELECT * FROM clients WHERE phone_numbers IS NULL""")
            rows = cur.fetchall()
        conn.close()
        return rows

    def delete_fone(self):
        conn = self.connect_db()
        with conn.cursor() as cur:
            cur.execute("""DELETE FROM clients WHERE phone_numbers IS NULL""")
            conn.commit()
        conn.close()




# Создаем объект класса Client
client2 = Client('Петр', 'Петров', 'Петрович', ['+7(903)123-45-67', '+7(903)123-45-67'])
client1 = Client('Иван', 'Иванов', 'Иванович', ['+7(903)123-45-67', '+7(903)123-45-67'])
# Добавляем клиента
# client1.add_client()
# поиск по фамилии
print(client1.find_client(last_name='Петров'))
# выводим все записи
print(client2.get_all_clients())
# удаление клиента
# client2.delete_client(1)


