{ ... }:
{
  flake.modules.darwin.base =
    { self, ... }:
    {
      system.configurationRevision = self.rev or self.dirtyRev or null;
    };
}
