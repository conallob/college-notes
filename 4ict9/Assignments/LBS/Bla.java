import java.io.*; 
 
class Bla { 
    public static void main ( String args[] ) throws Exception { 
        File data =  new File( "cinemas" ); 
 
        if ( !data.exists() || !data.canRead() ) { 
            System.out.println( "Ack! I'm a silly programming language which can't read " + data ); 
            return; 
        } 
 
        if ( data.isDirectory() ) { 
            String [] files = data.list(); 
            for (int i=0; i< files.length; i++) 
                System.out.println( files[i] ); 
        } 
        else 
            try { 
                FileReader fr = new FileReader ( data );
                BufferedReader in = new BufferedReader( fr );
                String line;
                while ((line = in.readLine()) != null) {
								if (line.endsWith(":")) {
									System.out.println(line.replace(':',',')); 
								} else if (line.startsWith("#")) {
									System.out.println("Coordinates: " + (line.replace('#',' ')).trim());
								} else if (line.length() > 2) {
									System.out.println(line);
								}	
							}
            } 
            catch ( FileNotFoundException e ) {
                System.out.println( "Ack! I'm a silly programming language who can't find your file!" ); 
            }
    } } 
