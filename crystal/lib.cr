@[Link(framework: "AppKit")]
lib C
  fun ns_application_main = NSApplicationMain(UInt32, UInt8**) : UInt32
end

C.ns_application_main(0, nil)
