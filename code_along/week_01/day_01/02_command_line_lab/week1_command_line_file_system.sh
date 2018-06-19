# ---
# source:
# - title: week1_command_line_file_system.md
#   url: https://gist.github.com/epoch/ad2fc18f1c65f3696bfa6202a4579cc6#file-week1_command_line_file_system-md
# ---
#
# # Command line lab
#
# ## Introduction
#
# > ***Note:*** _This can be a pair programming activity or done independently._
#
# Developing web apps requires a degree of comfort navigating and interacting
# with your operating system through the command line, and similar to how you'll
# be practicing writing and running Ruby and JavaScript later in the course,
# we'll be practicing creating, modifying, and moving files and folders in your
# terminal to get you practicing Unix commands.
#
# For your first lab, you're going to create files and folders to organize your
# favorite books, movies, and music - then, you're going to reorganize them.
#
# Be sure to use the cheat sheets in the "Additional Resources" section in case
# you get stuck.
#
# ## Exercise
#
# #### Requirements
#
# From your home directory, create a folder called "my-favorite-things"; you'll
# use that folder to do the exercises below.
mkdir my-favorite-things

# - Organize your favorite books
#   - in the "my-favorite-things" folder, create a folder called "books"
mkdir my-favorite-things/books

#   - create a folder in books named after your favorite author (e.g. "mark-
#     twain", or "john-grisham", but avoid spaces!)
mkdir my-favorite-things/books/{mark-twain,john-grisham}

#   - create files named after some of the author's books in the author's folder
touch "my-favorite-things/books/mark-twain/The Adventures of Tom Sawyer (1876)"
touch "my-favorite-things/books/john-grisham/A Time to Kill (1989)"

#   - open the books folder in Atom/Sublime
#   - to each book file, add a brief description of the book
#

echo "
Tom Sawyer lives with his Aunt Polly and his half-brother Sid. He skips school
to swim and is made to whitewash the fence the next day as punishment. He
cleverly persuades his friends to trade him small treasures for the privilege of
doing his work.

Tom falls in love with Becky Thatcher, a new girl in town, and persuades her to
get \"engaged\" by kissing him. But their romance collapses when she learns Tom
has been \"engaged\" previously to Amy Lawrence. Shortly after Becky shuns him, he
accompanies Huckleberry Finn to the graveyard at night, where they witness a
trio of body snatchers, Dr. Robinson, Muff Potter, and Injun Joe, getting into a
fight in which Robinson is murdered by Injun Joe.
" > "my-favorite-things/books/mark-twain/The Adventures of Tom Sawyer (1876)"

echo "
In the small town of Clanton, in fictional Ford County, Mississippi, a ten-year-
old African-American girl named Tonya Hailey is viciously raped and beaten by
two redneck white supremacists, James \"Pete\" Willard and Billy Ray
Cobb. Tonya is later found and rushed to the hospital while Pete and Billy Ray
are heard bragging at a roadside bar about their crime. Tonya's distraught and
outraged father, Carl Lee Hailey, consults his friend Jake Brigance, a white
attorney who had previously represented Hailey's brother, on whether he could
get himself acquitted if he killed the two men. Jake tells Carl Lee not to do
anything stupid, but admits that if it had been his daughter, he would kill the
rapists. Carl Lee is determined to avenge Tonya and, while Pete and Billy Ray
are being led into holding after their bond hearing, he kills both men with an
M-16.
" > "my-favorite-things/books/john-grisham/A Time to Kill (1989)"

#
# - Organize your favorite movies
#
#   - in the "my-favorite-things" folder, create a folder called "movies"
mkdir my-favorite-things/movies

#   - create a folder in movies named after your favorite actor
mkdir "my-favorite-things/movies/Tom Hanks"

#   - create a folder in the actor folder named after the actor's breakthrough
#     movie
mkdir "my-favorite-things/movies/Tom Hanks/He Knows You're Alone (1980)"

#   - create a text file named after the actor's character in the breakthrough
#     movie in the top level "movies" directory
touch "my-favorite-things/movies/Elliot.txt"

#   - move the text file to the breakthrough movie's folder
mv "my-favorite-things/movies/Elliot.txt" "my-favorite-things/movies/Tom Hanks/He Knows You're Alone (1980)/.txt"

#   - open the file in Sublime/Atom and edit that text file with a description
#     of the character's role in the movie
echo "Elliot, a psychology student, while jogging through a forest trail." > "my-favorite-things/movies/Tom Hanks/He Knows You're Alone (1980)/.txt"

#
# - Organize your favorite music
#
#   - in the my-favorite-things folder, create a folder called "music"
mkdir "my-favorite-things/music/"

#   - move into the "music" folder
cd "my-favorite-things/music/"

#   - create a folder called "disco"
mkdir disco

#   - create a text file in "disco" called "ymca.txt"
touch disco/ymca.txt

#   - delete the "disco" folder
rm -R disco

#   - create a folder called "creed"
mkdir creed

#   - delete the "creed" folder
rm -r creed

#   - create folders called "one-direction", "the-strokes", and "rihanna"
mkdir {one-direction,the-strokes,rihanna}

#   - create a text file in "one-direction" called "what-makes-you-
#     beautiful.txt"
touch "one-direction/what-makes-you-beautiful.txt"

#   - make two copies of "what-makes-you-beautiful.txt" - one into "the-strokes"
#     and one into "rihanna" and rename those files with songs by those artists
cp "one-direction/what-makes-you-beautiful.txt" "the-strokes/"
cp "one-direction/what-makes-you-beautiful.txt" "rihanna/"

#
# - Reorganize _everything_
#
#   - in the my-favorite-things folder, create a folder called "media"
cd ../../
mkdir media

#   - move "books", "movies", and "music" into the "media" folder
mv books media/
mv movies media/
mv music media/

#
# - Organize the top music, movies, and books of 2015
#
#   - move into the my-favorite-things folder and copy the "media" folder, then,
#     rename it "2015-media"
cp media 2015-media

#   - in the “2015-media” folder, rename each folder to have "2015-" before the
#     title
mv 2015-media/books 2015-media/2015-books
mv 2015-media/movies 2015-media/2015-movies
mv 2015-media/music 2015-media/2015-music

#   - delete the contents of "2015-music", "2015-movies", and "2015-books"
rm -R 2015-media/2015-books/*
rm -R 2015-media/2015-movies/*
rm -R 2015-media/2015-music/*

#   - create a file called "top-ten-movies.html" in "2015-movies"
touch 2015-media/2015-movies/top-ten-movies.html

#   - create a file called "top-ten-songs.html" in "2015-music"
touch 2015-media/2015-music/top-ten-songs.html

#   - create a file called "top-ten-books.html" in "2015-books"
touch 2015-media/2015-books/top-ten-books.html

#   - create an ordered list - using HTML! - of the top 10 movies, songs, and
#     books in each of the appropriate files
echo "
<ul>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
</ul>
" > {2015-media/2015-movies/top-ten-movies.html,2015-media/2015-music/top-ten-songs.html,2015-media/2015-books/top-ten-books.html}

#
# **Bonus**
#
# - Look through the additional resources and do the following without leaving
#   your terminal:
#
#   - look at the top and bottom 10 lines of each file

# head <filename>
# tail <filename>

#   - search for a string of text in a file

# grep <filename> <string>

#
# #### Starter code
#
# No starter code needed for this lab!
#
# #### Deliverable
#
# Be sure you open up your "my-favorite-things" directory in Sublime/Atom, so
# you can track your progress on the side of the application. Here's a look at
# what your files/folders should look like after each big step in the exercise:
#
# - After "Organize your favorite books":
#
# ![](https://i.imgur.com/ySAjOeO.png)
#
# - After "Organize your favorite movies":
#
# ![](https://i.imgur.com/h8WcyVE.png)
#
# - After "Organize your favorite music":
#
# ![](https://i.imgur.com/T4E3eAg.png)
#
# - After "Reorganize _everything_"
#
# ![](https://i.imgur.com/GEoIps9.png)
#
# - After "Organize the top music, movies, and books of 2015"
#
# ![](https://i.imgur.com/EM2m8mL.png)
#
#
# ## Additional Resources
#
# - A list of
#   [CLI Shortcuts](https://gist.github.com/alexpchin/01caa027b825d5f98871)
#
