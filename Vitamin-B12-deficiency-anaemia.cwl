cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  anaemia---primary:
    run: anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  vitamin-b12-deficiency-anaemia-monitoring---primary:
    run: vitamin-b12-deficiency-anaemia-monitoring---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: anaemia---primary/output
  vitamin-b12-deficiency-anaemia-assessment---primary:
    run: vitamin-b12-deficiency-anaemia-assessment---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia-monitoring---primary/output
  vitamin-b12-deficiency-anaemia-injection---primary:
    run: vitamin-b12-deficiency-anaemia-injection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia-assessment---primary/output
  vitamin-b12-deficiency-anaemia---primary:
    run: vitamin-b12-deficiency-anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia-injection---primary/output
  vitamin---primary:
    run: vitamin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia---primary/output
  pernicious-vitamin-b12-deficiency-anaemia---primary:
    run: pernicious-vitamin-b12-deficiency-anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: vitamin---primary/output
  congenital-vitamin-b12-deficiency-anaemia---primary:
    run: congenital-vitamin-b12-deficiency-anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: pernicious-vitamin-b12-deficiency-anaemia---primary/output
  other-vitamin-b12-deficiency-anaemia---primary:
    run: other-vitamin-b12-deficiency-anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: congenital-vitamin-b12-deficiency-anaemia---primary/output
  dietary-vitamin-b12-deficiency-anaemia---primary:
    run: dietary-vitamin-b12-deficiency-anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: other-vitamin-b12-deficiency-anaemia---primary/output
  vitamin-b12-deficiency-anaemia-unspecified---primary:
    run: vitamin-b12-deficiency-anaemia-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: dietary-vitamin-b12-deficiency-anaemia---primary/output
  vitamin-b12-deficiency-anaemia-combined---primary:
    run: vitamin-b12-deficiency-anaemia-combined---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia-unspecified---primary/output
  vitamin-b12-deficiency-anaemia-degeneration---primary:
    run: vitamin-b12-deficiency-anaemia-degeneration---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia-combined---primary/output
  vitamin-b12-deficiency-anaemia---secondary:
    run: vitamin-b12-deficiency-anaemia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia-degeneration---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: vitamin-b12-deficiency-anaemia---secondary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
