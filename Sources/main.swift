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
let window = connection.createWindow(
	parent: screen.root,
	x: 0,
	y: 0,
	width: 150,
	height: 150,
	borderWidth: 0,
	windowClass: .inputOutput,
	visual: screen.rootVisual,
	flags: Set<WindowFlag>([
		.backPixel(screen.blackPixel),
		.eventMask([EventMask.keyRelease, EventMask.keyPress, EventMask.exposure, EventMask.structureNotify, EventMask.pointerMotion, EventMask.buttonPress, EventMask.buttonRelease])
	])
)
let protocolsAtomRequest = connection.internAtomOnlyIfExists(name: "WM_PROTOCOLS")
let protocolsAtom = try protocolsAtomRequest.reply()
let deleteWindowAtomRequest = connection.internAtom(name: "WM_DELETE_WINDOW")
let deleteWindowAtom = try deleteWindowAtomRequest.reply()
//let setProtocolsRequest = window.changeProperty(protocolsAtom, mode: .replace, type: .atom, format: .uint32, length: 1, data: &deleteWindowAtom)
//try setProtocolsRequest.reply()
window.map()
connection.flush()

pause()
