{
  description = "ST with opinionated patches";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; {
      myPackage = st.overrideAttrs (oldAttrs: rec {
        src = self;

        # Debug
        #dontStrip = true;
        #makeFlags = [ "CFLAGS=-g" ] ++ oldAttrs.makeFlags;
      });
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.myPackage;
  };
}
