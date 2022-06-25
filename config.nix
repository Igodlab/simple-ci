{
  packageOverrides = pkgs: {
    haskellPackages = pkgs.haskellPackages.override {
      overrides = haskellPackagesNew: haskellPackagesOld: {
        simple-ci = haskellPackagesNew.callPackage ./default.nix { };
      };
    };
  };
}
