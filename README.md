Exercise template
=================

## How to start using the template:

Before starting, make sure you are certain about following:

* __name of your own course subgroup__ (check version.aalto.fi if you are not sure). In most cases this will be same as your git username.

* __name of your new project__

These two will be referred further as `<your-subgroup-name>` and `<your-project-name>` accordingly.

---

1. Clone the template repository under a new name.

```
git clone git@version.aalto.fi:elec-e3540-exec/exercise_template.git <your-project-name>
```

2. Remove the origin link an specify a new one within your own course
   subgroup.

```
cd <your-project-name>
git remote rm origin
git remote add origin git@version.aalto.fi:elec-e3540-exec/<your-subgroup-name>/<your-project-name>.git
```

3. Upload the project to a new origin you specified (this creates a new project
   in your subgroup.

```
git push --set-upstream origin master
```

4. Your new project is now visible at
   version.aalto.fi/elec-e3540-exec/<your-subgroup-name>

5. Intialize the instructions submodule

```
git submodule update --init Exercise_instructions
```

6. (optional) Use the QuestaSim do-file to run simulation _(assuming you are
   logged into Vspace)_

```
cd simulations
use advms_17.1
vsim -do run_simulation.do
```

7. You can start developing! Make new entities and do-files if necessary. Don't
   forget to add, commit, and push to save your progress.

