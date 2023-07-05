state("Duck Simulator 2") {

}

init {
    vars.test = 0;
    vars.testtwo = 0;
}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
  vars.Helper.GameName = "Duck Simulator 2";
  vars.Helper.LoadSceneManager = true;
  settings.Add("FifthWall", true, "don't stop this");
  settings.Add("rpgLevel10", true, "murderer path");
  settings.Add("rpgLevel9", true, "Pacifist or half murderer");
}

update 
{
    current.scene = vars.Helper.Scenes.Active.Name;
}
start 
{
    if (current.scene == "ClickerScene") {
        return true;
    }
}

split
{
    return old.scene != current.scene && settings[old.scene];
    if (current.scene == "platformeLevel1" && vars.test == 0) {
        return true;
        vars.test = 1;
    } 
    if (current.scene == "rpgLevel1" && vars.testtwo == 0) {
        return true;
        vars.testtwo = 1;
    }
}
