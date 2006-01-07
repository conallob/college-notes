// $Id$


#include "BankersController.h"


/*

	My Pseudo code representation of what the Controller is supposed to check for.

*/

/*

BEGIN
	DECLARE STATE = FALSE;

//	Not enough resources, greedy process...

	IF (REQUEST [i] > NEED [i]) THEN
		PRINT "you're asking for more than the maximum resources declared"
		RETURN
	ENDIF

//	Not enough resources available. Get back in line!!

	IF (REQUEST [i] > AVAILABLE [i]) THEN
		PRINT "Sorry! Resources are not available at this time"
		RETURN
	ENDIF

	ALLOCATION [i] = ALLOCATION [i] + REQUEST [i];
	AVAILABLE [i]= AVAILABLE [i] Ð REQUEST [i];
	STATE = SAFESTATE ();

//	Here you go...

	IF (STATE == TRUE) THEN
		PRINT "Here you go"
		RETURN;
	ELSE

//	Sorry, no resources for you!

		ALLOCATION [i] = ALLOCATION [i] Ð REQUEST [i];
		AVAILABLE [i] = AVAILABLE [i]+ REQUEST [i];
		PRINT "The request cannot be satisfied now, please try again later."
		RETURN;
	ENDIF

END BANKER  
	
*/
