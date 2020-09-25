# `dhall-hotspot`

## What is this?

[Dhall](https://github.com/dhall-lang/dhall-lang) bindings to [HotSpot](https://openjdk.java.net/groups/hotspot/).

The purpose is to let you easily typecheck, template and modularize HotSpot command line options.

## Design goals

- be complete: options defined for recent¹ HotSpot versions must be available
- be type safe: any produced combination of options must be safe to use
- be thoroughly tested: the two aforementioned properties must be checked

---

¹ As shipped as part of OpenJDK 8 and above