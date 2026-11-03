# P31-A. GC3: корректность расписаний

**Проектное задание:** [P31-A. GC3: корректность расписаний](https://distsys.ru/osukhoroslov/nis2/src/branch/main/project-tasks/p31-a-gc3-correctness.md)

**Участники:**

- Елисеев Владислав
- Малков Максим
- Некрасов Станислав

## Сокращённый запуск

### Окружение

Работоспособность проверялась на Python 3.12. Установить зависимости можно командой из корня репозитория:

```sh
python -m pip install .
```

Или использовать Nix dev shell:

```sh
nix develop
```

### Запуск примера

Для проверки работы библиотеки мы использовали библиотечную реализацию алгоритма кольцевого AllReduce на 2 GPU. Код примера находится в [examples/ring_allreduce.py](examples/ring_allreduce.py).

Запуск:

```sh
python examples/ring_allreduce.py
```

Результат сохраняется в файл `output.xml`. Его сохранённая копия доступна в [artifacts/example/ring_allreduce_2.xml](artifacts/example/ring_allreduce_2.xml).

## Навигация

- [Описание проекта](nis/project.md)
- [План эксперимента](nis/experiment-plan.md)
- [Контрольная точка 1](nis/checkpoints/01.md)
- [Контрольная точка 2](nis/checkpoints/02.md)
- [Контрольная точка 3](nis/checkpoints/03.md)
- [Состояние проекта](nis/status.md)
- [Результаты](nis/results.md)
- [Финальная версия](nis/final.md)
- Код: [путь]
- Тесты: [путь]
- Данные: [путь или описание внешнего хранилища]
