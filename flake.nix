{
  description = "My collection of Nix templates";

  outputs = { self }: {
    templates = {
      # The default one if you don't specify a name
      default = {
        path = ./python;
        description = "Flutter + Devenv environment";
      };

      # Your named templates
      flutter = {
        path = ./flutter;
        description = "Flutter + Devenv environment";
      };

      nodejs = {
        path = ./python;
        description = "Python + Devenv environment";
      };
    };
  };
}
