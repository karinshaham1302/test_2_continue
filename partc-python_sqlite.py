import sqlite3

conn = sqlite3.connect('05_02_2025.db')
conn.row_factory = sqlite3.Row
cursor = conn.cursor()


def show_all_movies():
    """
    Displays all movies from the 'movies' table.

    Executes a SELECT query to retrieve all rows from the 'movies' table
    and prints the movie details (name, genre, country, language, year, revenue).
    """
    query = "SELECT * FROM movies"
    cursor.execute(query)
    rows = cursor.fetchall()

    for row in rows:
        print(f"Movie: {row['movie_name']}, Genre: {row['genre']}, "
              f"Country: {row['country']}, Language: {row['language']}, "
              f"Year: {row['year']}, Revenue: {row['revenue']}")


def search_movie_by_name(search_term: str):
    """
    Searches for movies based on the movie name (or part of it).

    Executes a SELECT query to find movies where the 'movie_name' contains
    the provided search term, and prints the details of matching movies.

    :param search_term: A string or part of a movie name to search for.
    """
    query = "SELECT * FROM movies WHERE movie_name LIKE ?"
    cursor.execute(query, (f"%{search_term}%",))
    rows = cursor.fetchall()

    for row in rows:
        print(f"Movie: {row['movie_name']}, Genre: {row['genre']}, "
              f"Country: {row['country']}, Language: {row['language']}, "
              f"Year: {row['year']}, Revenue: {row['revenue']}")


def add_movie():
    """
    Adds a new movie to the 'movies' table.

    Prompts the user for the movie details and then inserts the data
    into the 'movies' table using an INSERT query.

    After insertion, the changes are committed to the database.
    """
    movie_name = input("Enter movie name: ")
    genre = input("Enter movie genre: ")
    country = input("Enter movie country: ")
    language = input("Enter movie language: ")
    year = int(input("Enter movie year: "))
    revenue = float(input("Enter movie revenue: "))

    query = ("INSERT INTO movies (movie_name, genre, country, language, year, revenue)"
             " VALUES (?, ?, ?, ?, ?, ?)")
    cursor.execute(query, (movie_name, genre, country, language, year, revenue))

    conn.commit()
    print(f"Movie '{movie_name}' added successfully!")


def get_choice_from_menu():
    """
    Displays the menu for selecting an action.

    Presents the user with a list of available options for interacting with the movie database.

    :return: The user's selected choice as a string.
    """
    print("Choose an option:")
    print("1. Show all movies")
    print("2. Search movie by name")
    print("3. Add new movie")
    print("4. Exit")
    choice = input("What would you like to do? ")
    return choice


def run_movie_db():
    """
    Runs the movie database application, presenting a menu of options to the user.

    The function allows the user to view all movies, search by movie name,
    add a new movie, or exit the application.

    Returns:
        None
    """
    while True:
        choice = get_choice_from_menu()
        match choice:
            case "1":
                show_all_movies()
            case "2":
                search_term = input("Enter movie name or part of name: ")
                search_movie_by_name(search_term)
            case "3":
                add_movie()
            case "4":
                print("Goodbye!")
                break
            case _:
                print("Invalid choice. Please try again.")


if __name__ == "__main__":
    run_movie_db()

conn.close()

# לא מצליחה להריץ את הקוד ולא מבינה למה
# אשמח להסבר
