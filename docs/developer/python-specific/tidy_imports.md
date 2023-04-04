Trying to keep your external dependencies as lean as possible is always important.

We like to separate out the imports at the top of the file, going a little further than the Python style guide, which just says that standard library imports should go first.

We list imports like this

```py title="example imports section"
# standard imports
import os

# third party imports
from django.http import HttpResponse

# RCPCH imports
from epilepsy12.constants.user_types import CAN_ALLOCATE_GENERAL_PAEDIATRIC_CENTRE, CAN_ALLOCATE_TERTIARY_NEUROLOGY_CENTRE
```

This allows us to see at a glance what is relatively 'highly trusted' code (PSF-maintained, standard library stuff) and then what is third-party code, which arguably the biggest source of potential security, maintenance and other issues. Doing this  makes us *think* about where the code came from.

Our `RCPCH imports` code is clearly identifiable and this is the stuff we should be testing in detail. But at least we have 100% control over it!
