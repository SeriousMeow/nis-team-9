rm -rf tmp-workspace
mkdir tmp-workspace
cd tmp-workspace

git clone https://github.com/microsoft/msccl-tools.git
cd msccl-tools
git checkout 030a750fc56e >/dev/null 2>&1

python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -e .

python3 ../../src/examples/ring_allreduce.py ../output.xml
echo "Результат запуска примера src/examples/ring_allreduce.py сохранён в tmp-workspace/output.xml"
