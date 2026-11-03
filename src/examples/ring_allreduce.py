import sys
from pathlib import Path

from msccl.language import MSCCLProgram, ThreadblockPolicy
from msccl.language.collectives import AllReduce
from msccl.programs.allreduce_a100_ring import allreduce_ring
from msccl.topologies import fully_connected


def main():
    output_filename = sys.argv[1] if len(sys.argv) >= 2 else "output.xml"

    program = MSCCLProgram(
        "ring_allreduce_2", fully_connected(2), AllReduce(2, 2, True), 1,
        threadblock_policy=ThreadblockPolicy.manual,
        instr_fusion=False,
        check_xml=False,
    )
    with program:
        allreduce_ring(2, 1)

        xml = program.generate_xml()

    Path(output_filename).write_text(xml, encoding="utf-8")


if __name__ == "__main__":
    main()
