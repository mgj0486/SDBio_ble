//
//  Project.swift
//  FirstManifests
//
//  Created by dev team on 2023/06/26.
//

import ProjectDescription
import ProjectDescriptionHelpers

let featureTarget = Target.createWithoutResource(
    targetName: Module.feature.name,
    product: .framework,
    scripts: [],
    dependencies: [
        .usecaseProject,
        .userInterfaceProject,
   ],
    settings: nil,
    coreDataModels: [CoreDataModel.coreDataModel(coreDataPath)]
)

let project = Project.create(
    name: Module.feature.name,
    packages: [
    ],
    targets: [
        featureTarget
    ],
    schemes: []
)
