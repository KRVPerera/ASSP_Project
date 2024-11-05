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

OPERATION(SIMDMAC)

TRIGGER

    int result;
	int in1 = INT(1);
	int in2 = INT(2);
    int in3 = INT(3);
    int in4 = INT(4);
    
    short SCALE = 8;
    short K0 = 37;
    short K1 = 109;
    short K2 = 109;
    short K3 = 37;

	result = (K0 * in1 + K1 * in2 + K2 * in3 + K3 * in4) >> SCALE;
	IO(5) = result;
END_TRIGGER;

END_OPERATION(SIMDMAC)
