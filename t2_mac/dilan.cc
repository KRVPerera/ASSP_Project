/**
 * OSAL behavior definition file.
 */

#include <iostream>
#include <fstream>
#include <math.h> // isnan()

#include "OSAL.hh"
#include "TCEString.hh"
#include "OperationGlobals.hh"
#include "Application.hh"
#include "Conversion.hh"

OPERATION(DILANMAC)

TRIGGER

    int result;
	int in1 = INT(1);
	int in2 = INT(2);
    int in3 = INT(3);

	result = (in1 * in2) + in3;
	IO(4) = result;
END_TRIGGER;

END_OPERATION(DILANMAC)