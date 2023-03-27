## Класс Client является примером реализации базовых операций для работы с базой данных PostgreSQL в языке Python с использованием библиотеки psycopg2. Класс реализует следующие методы:

__init__(self, first_name, last_name, email, phone_numbers): конструктор класса, который принимает параметры first_name, last_name, email и phone_numbers и создает объект класса Client.

connect_db(self): метод, который создает подключение к базе данных PostgreSQL.

add_client(self): метод, который добавляет нового клиента в базу данных.

update_client(self, id, first_name, last_name, email, phone_numbers): метод, который обновляет данные о клиенте в базе данных по указанному id.

delete_client(self, id): метод, который удаляет клиента из базы данных по указанному id.

find_client(self, first_name=None, last_name=None, email=None, phone_numbers=None): метод, который ищет клиента в базе данных по указанным параметрам first_name, last_name, email и phone_numbers. Если параметр не задан, он принимает значение None.

get_all_clients(self): метод, который возвращает список всех клиентов из базы данных.

get_all_clients_without_fone(self): метод, который возвращает список клиентов без номеров телефонов.

delete_fone(self): метод, позволяющий удалить телефон для существующего клиента.

