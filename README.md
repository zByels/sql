Script para configurar o vscode
Abra o Anaconda Prompt (anaconda3)


code --install-extension ms-python.python --force

code --install-extension ms-toolsai.jupyter --force

code --install-extension cweijan.vscode-database-client2

git clone https://github.com/caiohamamura/mysql_kernel --depth=1

cd mysql_kernel

python setup.py install

python -m mysql_kernel.install

code
