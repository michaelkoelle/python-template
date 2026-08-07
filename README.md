# 🐍 Python Template

I strongly recommend to use this template in combination with VSCode

#### 🤔 Why you should use this template:

- It provides a boilerplate to kickstart your project.
- It enforces type hinting, which avoids many bugs before they get written.
- It enforces good coding style, naming conversions and documentation.
- It auto formats your code and imports.
- You get a better autocompletion and quick fixes for common problems.

#### ⚙️ Requirements:

- [git](https://git-scm.com/)
- [VSCode](https://code.visualstudio.com/)
- [uv](https://docs.astral.sh/uv/) (manages Python versions, virtual environments and dependencies)

#### 🚀 How to use it:

- Clone this repository it using VSCode (Go to the `Source Control` tab and click on Clone Repository) or via the command line: `git clone https://github.com/michaelkoelle/python-template.git`. Change the directory `cd python-template`. Remove the old origin `git remote remove origin`. Create a new repository on github or gitlab. Then, use e.g. `git remote add origin https://github.com/<your-username>/<your-repo>.git` to add you new repository as origin. Finally, push your changes `git push -u origin main`. You can now also rename the folder if you want. Alternatively you can create a new repository, clone it and then download this repository as .zip and extract/overwrite the files in your project repository.
- Install the recommened extensions (there should be a pop up), otherwise type `CTRL+SHIFT+P` and search for `Show Recommended Extensions`.
- Install uv: `curl -LsSf https://astral.sh/uv/install.sh | sh` (macOS/Linux) or `powershell -c "irm https://astral.sh/uv/install.ps1 | iex"` (Windows).
- Create the virtual environment and install the dependencies: `uv sync`. This creates a `.venv` folder in the project. uv downloads a matching Python version automatically if you do not have one.
- Select the interpreter in VSCode: `CTRL+SHIFT+P`, `Python: Select Interpreter`, choose the one in `./.venv`.
- Go to the `Run and Debug` tab and run the progam. Alternatively run it from the command line: `uv run src/main.py`.
- Add customize the `src/main.py` and add your own code into the [`/src`]() folder.
- FYI: Progam arguments can be inserted here: `/.vscode/launch.json`

#### 📦 Managing dependencies:

- Add a dependency: `uv add numpy`. Add a development-only dependency (linters, test runners): `uv add --dev pytest`.
- Remove a dependency: `uv remove numpy`.
- Update all dependencies to their latest allowed versions: `uv sync --upgrade`.
- Run anything inside the environment: `uv run <command>` (e.g. `uv run ruff check src`).

#### 🤝 When sharing your code:

Commit `pyproject.toml` and `uv.lock`. Anyone who clones your repository gets the exact same versions with a single `uv sync`.

#### 📚 Libraries used:

- [uv](https://docs.astral.sh/uv/): For managing the Python version, the virtual environment and the dependencies
- [ruff](https://pypi.org/project/ruff/): For linting, formatting and sorting imports

#### 🧰 Recommended VSCode Extensions:

- [One Dark Pro Theme](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme): Best Theme that supports tokenization. This means that colors have meaning e.g. Strings are green, Functions are blue, etc.
- [Python (Pylance)](https://marketplace.visualstudio.com/items?itemName=ms-python.python): Language Support for Python.
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments): Color Coding for Comments. Automatically highlights comments with TODO in it.
- [Gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens): Lets you view for every line when the code was committed and who wrote it.
- [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack): Lets you easily connect to another machine remotely using SSH. Also a easy way to view and download files you created on the remote machine.
- [Ruff](https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff): Extremely fast Python linter and code formatter. Can be used to replace Flake8 (plus dozens of plugins), Black, isort, pyupgrade, and more. 

#### 💾 Working with git:

I recommend using the Source Control tab of VSCode, here you can see all the changes, draft a commit message and push the code to the remote.

#### 📊 Slurm:

- Login to on of the nodes of the Slurm cluster. (e.g. `<cip-kennung>@remote.cip.ifi.lmu.de`), I recommend using the VSCode Remote Extension.
- Make sure uv is installed and ready to use: `uv --version`. If it is missing, `job.sh` installs it for you on the node.
- Clone the repository.
- You can find the configuration files in the `/jobs` directory
- Edit the `job.sh` file and insert your email address and customize it to your liking.
- Edit the `run-jobs.sh` file to fit you needs. I provided a simple example for a reinforcement learning usecase.
- You may need to modify the file permissions of `job.sh` and `run-jobs.sh` to be able to execute it with: `chmod +x job.sh` and `chmod +x run-jobs.sh`
- You can execute `jobs/run-jobs.sh` from the root of your project to schedule multiple runs in parallel. (**Caution**: On the LMU CIP Pool Cluster you can only execute 15 jobs in parallel and queue a total of 30 jobs.)

#### 🚧 Caveats

- There is only so much a template can do. Bad code is still bad code!
- Some libraries do not support type hinting.
- Package `isort` does not automatically remove unused imports, see discussion [here](https://github.com/PyCQA/isort/issues/1105).
- There is a problem with pyright and function overrides in subclasses, see discussion [here](https://github.com/microsoft/pyright/issues/1787). Workaround is to insert `pyright: reportIncompatibleMethodOverride=false` at the top of the file.

#### ❓ FAQ:

##### What is uv

uv is an extremely fast Python package and project manager written in Rust. It replaces pyenv, virtualenv, pip and pip-tools with a single tool: it installs Python versions, creates the virtual environment, resolves and locks your dependencies and runs your code. To install it, follow the instructions on the [official documentation](https://docs.astral.sh/uv/getting-started/installation/).

Some common uv commands include:

- `uv sync`: Create the virtual environment and install exactly what is in `uv.lock`.
- `uv add <package>` / `uv remove <package>`: Add or remove a dependency (updates `pyproject.toml` and `uv.lock`).
- `uv run <command>`: Run a command inside the project environment, syncing it first if needed.
- `uv lock --upgrade`: Re-resolve all dependencies to their latest allowed versions.
- `uv python install <version>` / `uv python list`: Install or list Python versions.

##### What is a virtual environment

Python virtual environments are isolated environments that enable developers to manage dependencies and Python versions for individual projects without interfering with other projects or the system-wide Python installation. Virtual environments help to avoid conflicts between different library versions, providing a clean and reproducible development setup for each project.

uv creates and manages the environment for you in the `.venv` folder of the project, so you rarely have to activate it manually — prefixing a command with `uv run` is enough. If you do want to activate it: `source .venv/bin/activate` (macOS/Linux) or `.venv\Scripts\activate` (Windows).

##### What is slurm

Slurm is an open-source, highly scalable, and fault-tolerant cluster management and job scheduling system for Linux clusters. It is not specific to Python but can be used to manage and schedule Python jobs on distributed computing resources. To get started with Slurm, refer to the [official documentation](https://slurm.schedmd.com/documentation.html) or the [LRZ documentation](https://doku.lrz.de/display/PUBLIC/SLURM+Workload+Manager)

#### 💬 Questions or Improvements?

Create a [issue](https://github.com/michaelkoelle/python-template/issues) or hit me up: [michael.koelle@ifi.lmu.de](mailto:michael.koelle@ifi.lmu.de)
