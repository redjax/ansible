# Description

## Included modules

- [yamllint](https://yamllint.readthedocs.io/en/stable/quickstart.html#running-yamllint)
  - Lint `.yaml` files for key repetition, syntax, etc
  - Examples:
    - `$ yamllint file.yml other-file.yaml`
    - `$ yamllint .`
    - `$ yamllint file.yml -f colored`
- [ARA Records Ansible](https://github.com/ansible-community/ara)
  - Records `ansible`/`ansible-playbook` commands, wherever they are run from
    - Terminal (by hand or a script)
    - Laptop, desktop, server, vm, or container
    - CI
- [Ansible Runner](https://ansible-runner.readthedocs.io/en/stable/)
- [Ansible Doctor](https://ansible-doctor.geekdocs.de/usage/getting-started/)
  - Document Ansible files with annotations
  - Intented to be run from a CI pipeline
- [Molecule](https://molecule.readthedocs.io/en/latest/getting-started.html)
  - Aids in the developement & testing of Ansible roles/playbooks
- [Ansible Navigator](https://github.com/ansible/ansible-navigator)
  - Text based user interface (TUI) for Ansible
- [PDM](https://pdm.fming.dev/latest/)
  - Python Dependency Manager
  - Alternative to `Poetry`
  - Install:
    - `pipx install pdm`
  - Usage:
    - `pdm install`
    - `pdm sync`
      - Installs from lockfile
      - `--clean`: removes packages no longer in the lockfile
      - `--only-keep`
    - `pdm list`
      - List dependencies
  - [User scripts](https://pdm.fming.dev/latest/usage/scripts/#user-scripts)

> [tool.pdm.scripts]
> start = "flask run -p 54321"

`$ pdm run start`

# Notes & Links

## Notes

## Links

- [Ansible Real Life Good Practices](https://reinteractive.com/articles/Ansible-Real-Life-Good-Practices)
- [Ansible best practices (2017)](https://andidog.de/blog/2017-04-24-ansible-best-practices)
- [Git Ansible](https://adamtheautomator.com/git-ansible/)
  - Git operations (public & private repos) in Ansible playbooks
- [Testing your Ansible roles with Molecule](https://www.jeffgeerling.com/blog/2018/testing-your-ansible-roles-molecule)
