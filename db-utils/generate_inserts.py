from math import random

def execute_stmt(db_name: str, query: str):
    "execute here"

def insert_user(user_name: str, email: str):
    f"""
    INSERT INTO app_sch."user"
    (
        id, email, name, surname, mobile
    )
    VALUES 
    (
        default, '{email}', '{name}', '{name}', '{random.randint(100000, 999999)}'
    );
    """


if __name__ == '__main__':

    number = 1

    user_name = f'test_{number}' 
    email = generate_email(user_name)

    insert_query = f'''
      {insert_user(user_name, email)}
   
    '''

    