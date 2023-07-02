state("Duck Simulatator 2") {}

startup
{
  Assembly.Load(File.ReadAllBytes("asl-help")).CreateInstance("Unity");
  vars.Helper.GameName = "gameIrenamed";
  vars.Helper.LoadSceneManager = true;
}

update 
{
    current.Scene = vars.Helper.Scenes.Active.Name;
}

start 
{
    return old.Scene != current.Scene && settings[old.Scene];
}