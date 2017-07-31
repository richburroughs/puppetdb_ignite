# Include the role specified by the "role" key in hiera
include "::role::${lookup('role', String[1])}"
