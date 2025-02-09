import ProjectDescription
import ProjectDescriptionHelpers


private let mainTarget = Target.create(
    targetName: mainProjectName,
    infoPlist: infoplistpath,
    entitlements: entitlementsPath,
    product: .app,
    scripts: [],
    dependencies: [
        .featureProject,
    ],
    settings: settings,
    coreDataModels: [CoreDataModel.coreDataModel(coreDataPath)]
)

let project = Project.create(
    name: mainProjectName,
    packages: [],
    targets: [mainTarget],
    schemes: []
)
