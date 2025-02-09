//
//  Project.swift
//  FirstManifests
//
//  Created by dev team on 2023/06/26.
//

import ProjectDescription
import ProjectDescriptionHelpers

let entitiesTarget = Target.createWithoutResource(
    targetName: Module.entities.name,
    product: .framework,
    scripts: [],
    dependencies: [
    ],
    settings: nil,
    coreDataModels: []
)

let project = Project.create(
    name: Module.entities.name,
    packages: [
    ],
    targets: [
        entitiesTarget
    ],
    schemes: []
)
