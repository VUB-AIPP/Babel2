# Physical Robot World

Common Lisp interface to the robotdata repository.

## Build-in Classes

### Class `robot-world`

 - Slots
   - `data-sets`; a list of datasets (subfolders of the robotdata folder)
   - `scenes`; a list of scenes
   - `current-scene`; the current scene (of type `robot-scene`)
 - Methods
   - `get-world-model`; to get a particular world model
   - `next-scene`; to get a random scene and set the current scene slot

### Class `robot-scene`

 - Slots
   - `name`; the name of the scene 
   - `wm-a`; world-model a of the scene (of type `robot-world-model`)
   - `wm-b`; world-model b of the scene (of type `robot-world-model`)
   - `source-path`; source path of the scene
 - Methods
   - `check-scene`; to check the scene when loading it 

### Class `robot-world-model`

 - Slots
   - `id`; the id
   - `timestamp`; a timestamp
   - `source-path`; source path of the world model
   - `robot`; the robot associated to this world model (a or b)

### Class `physical-robot-world`

 - Superclasses
   - `robot-world`
 - Methods
   - `initialize-instance :after`; initialize the physical-robot-world with particular data-sets

### Class `physical-robot-scene`

 - Superclasses
   - `robot-scene`

### Class `physical-robot-world-model`

 - Superclasses
   - `robot-world-model`
 - Slots
   - `entities`; the objects in this world model (of type `physical-robot-world-object`)

### Class `physical-robot-world-object`

 - Slots
   - `id`; the id
   - `features`; an a-list of feature-value pairs
 - Functions
   - `add-feature`; add a feature-value pair to an object
   - `find-feature`; find a feature-value pair or return nil
   - `find-fvalue`; find a feature-value pair and return the value or return nil
   - `get-fvalue`; find a feature-value pair and return the value or throw an error
   - `robot-p`; check if an object is a robot
   - `box-p`; check if an object is a box
   - `region-p`; check if an object is a region
   - `object-p`; check if an object is an object
   - `get-type`; get the type of an object

### Other functions

 - `physical-robot-interpret-pointing`; interprets a pointing gesture in a robot's own coordinate system. X and Y are the coordinates of the object pointed to in the coordinate system of the pointer. Returns the ID of the closest object to the position of the coordinates. Only to be used 

## How to use

 1. Make sure the global variable `*robotdata-path*`, defined in the file `robot-world.lisp`, points to the location of your `robotdata` directory.
 2. Create an instance of the `physical-robot-world`.
   - You have to pass the keyword argument `:data-sets`. This should be a list of the names of the datasets (i.e. subdirectories of `robotdata`) that you want to load.
   - The keyword argument `:check-scene-methods` contains a list of function names. Each of these functions will be ran when loading the dataset. These functions will check the validity of each scene.
   - The keyword argument `:exclude-scenes` can be used to skip certain scenes when loading the datasets
   - The keyword argument `:warn` should be a bool, indicating if the user should be warned when one of the check-scene methods finds something wrong.
 3. To sample a random scene for a given interaction, use the `next-scene` method. This will return a random scene and at the same time set the `current-scene` slot of the `physical-robot-world` instance. Remember that a scene does not yet contain the objects, but contains both world models!