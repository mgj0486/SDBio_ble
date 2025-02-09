//
//  Project.swift
//  FirstManifests
//
//  Created by dev team on 2023/06/26.
//

import ProjectDescription
import ProjectDescriptionHelpers

let entitiesTarget = Target.createWithoutResource(
    targetName: Module.core.name,
    product: .framework,
    scripts: [],
    dependencies: [
    ],
    settings: nil,
    coreDataModels: []
)

let project = Project.create(
    name: Module.core.name,
    packages: [
    ],
    targets: [
        entitiesTarget
    ],
    schemes: []
)
