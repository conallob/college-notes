import tcdIO.*; 

class c3ex4 {
  public static void main (String args[]) {
    Terminal terminal;
    Book book1, book2, book3, book4;
	 String tmpTitle, tmpAuthors, tmpPublisher, tmpDateOfPublication;

    terminal = new Terminal("Chapter 3: Exercise 4");


	 //input the details of book1
	 tmpTitle = terminal.readString("Enter the title of book #1:");
	 tmpAuthors = terminal.readString("Enter the authors of book #1:");
	 tmpPublisher = terminal.readString("Enter the publisher of book #1:");
	 tmpDateOfPublication = terminal.readString("Enter the date of publication of book #1:");
	 //create the book1 object
    book1 = new Book(tmpTitle, tmpAuthors, tmpPublisher, tmpDateOfPublication);

	 //input the details of book2
	 tmpTitle = terminal.readString("Enter the title of book #2:");
	 tmpAuthors = terminal.readString("Enter the authors of book #2:");
	 tmpPublisher = terminal.readString("Enter the publisher of book #2:");
	 tmpDateOfPublication = terminal.readString("Enter the date of publication of book #2:");
	 //create the book2 object
    book2 = new Book(tmpTitle, tmpAuthors, tmpPublisher, tmpDateOfPublication);

	 //input the details of book3
	 tmpTitle = terminal.readString("Enter the title of book #3:");
	 tmpAuthors = terminal.readString("Enter the authors of book #3:");
	 tmpPublisher = terminal.readString("Enter the publisher of book #3:");
	 tmpDateOfPublication = terminal.readString("Enter the date of publication of book #3:");
	 //create the book3 object
    book3 = new Book(tmpTitle, tmpAuthors, tmpPublisher, tmpDateOfPublication);

	 //input the details of book4
	 tmpTitle = terminal.readString("Enter the title of book #4:");
	 tmpAuthors = terminal.readString("Enter the authors of book #4:");
	 tmpPublisher = terminal.readString("Enter the publisher of book #4:");
	 tmpDateOfPublication = terminal.readString("Enter the date of publication of book #4:");
	 //create the book4 object
    book4 = new Book(tmpTitle, tmpAuthors, tmpPublisher, tmpDateOfPublication);

	 //output the titles of the 4 books
    terminal.println("The title of book #1 is: " + book1.getTitle());
    terminal.println("The title of book #2 is: " + book2.getTitle());
    terminal.println("The title of book #3 is: " + book3.getTitle());
    terminal.println("The title of book #4 is: " + book4.getTitle());


 }
}   
