// $Id$


#include "BankersController.h"


/*

BANKER

BEGIN
	DECLARE STATE = FALSE;

//	Not enough resources, greedy process...

	IF (REQUEST [i] > NEED [i]) THEN
		PRINT “Cannot asking more than the maximum declared”
		RETURN
	ENDIF

//	Not enough resources available. Get back in line!!

	IF (REQUEST [i] > AVAILABLE [i]) THEN
		PRINT “Resources are not available at this time”
		RETURN
	ENDIF

	ALLOCATION [i] = ALLOCATION [i] + REQUEST [i];
	AVAILABLE [i]= AVAILABLE [i] – REQUEST [i];
	STATE = SAFESTATE ();

//	Here you go...

	IF (STATE == TRUE) THEN
		PRINT “The request is approved”
		RETURN;
	ELSE

//	Sorry, no resources for you!

		ALLOCATION [i] = ALLOCATION [i] – REQUEST [i];
		AVAILABLE [i] = AVAILABLE [i]+ REQUEST [i];
		PRINT “The request cannot safely be satisfied now”
		RETURN;
	ENDIF

END BANKER  
	
*/
