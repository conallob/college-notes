/*A class whose instances represent books*/
class Book {
  private String title;  
  private String authors;  
  private String publisher;  
  private String dateOfPublication;  

  public Book(String titleToSet, String authorsToSet,String publisherToSet,String dateOfPublicationToSet) {
  
	  title = titleToSet;
	  authors = authorsToSet;
	  publisher = publisherToSet;
	  dateOfPublication = dateOfPublicationToSet;
  }

  //return the title
  public String getTitle(){
	  return title;
  }

  //return the authors
  public String getAuthors(){
	  return authors;
  }

  //return the publisher
  public String getPublisher(){
	  return publisher;
  }

  //return the date of publication
  public String getDateOfPublication(){
	  return dateOfPublication;
  }

}
