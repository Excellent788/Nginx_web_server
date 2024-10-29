import subprocess
subprocess.run(["ssh-keygen", "-t", "rsa", "-b", "4096", "-f", "excel"], check=True)
subprocess.run(["terraform", "init"], check=True)
subprocess.run(["terraform", "plan"], check=True)
subprocess.run(["terraform", "apply", "-auto-approve"], check=True)
