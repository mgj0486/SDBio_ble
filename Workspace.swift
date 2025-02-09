//
//  Workspace.swift
//  Config
//
//  Created by Moon kyu Jung on 2023/06/27.
//


import ProjectDescription
import ProjectDescriptionHelpers

private func projectNameWith(module: Module) -> Path {
    return "SDBio_ble/\(module.name)"
}

let workspace = Workspace(
    name: Workspace.workspaceName,
    projects: [
        "SDBio_ble/\(mainProjectName)",
    ] + Module.allCases.map({ projectNameWith(module: $0) })
)
