rm -rf tmp-workspace
mkdir tmp-workspace
cd tmp-workspace

python3 -m venv .venv
source .venv/bin/activate
pip install ..

python3 ../src/examples/ring_allreduce.py output.xml
echo "Результат запуска примера src/examples/ring_allreduce.py сохранён в tmp-workspace/output.xml"
