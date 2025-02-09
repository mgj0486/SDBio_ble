//
//  Project.swift
//  FirstManifests
//
//  Created by dev team on 2023/06/26.
//

import ProjectDescription
import ProjectDescriptionHelpers

let usecaseTarget = Target.createWithoutResource(
    targetName: Module.usecase.name,
    product: .framework,
    scripts: [],
    dependencies: [
        .entitiesProject,
    ],
    settings: nil,
    coreDataModels: []
)


let project = Project.create(
    name: Module.usecase.name,
    packages: [
    ],
    targets: [
        usecaseTarget
    ],
    schemes: []
)
