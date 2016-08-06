import ForgeSpark
import BigPaws
import Glibc

let instance = Instance(
    applicationName: "TriForge",
    applicationVersion: Vulkan.makeVersion(major: 0, minor: 0, patch: 1),
    engineName: "TriForge",
    engineVersion: Vulkan.makeVersion(major: 0, minor: 0, patch: 1),
    apiVersion: Vulkan.makeVersion(major: 1, minor: 0, patch: 21),
    layers: [],
    extensions: [Vulkan.KHRSurfaceExtensionName, Vulkan.XCBSurfaceExtensionName]
)
let connection = Connection()
let setup = connection.getSetup()
let iterator = setup.rootsIterator()
let screen = iterator.data()
let window = connection.createWindow(parent: screen.root, visual: screen.rootVisual)
connection.mapWindow(window)
connection.flush()

pause()
