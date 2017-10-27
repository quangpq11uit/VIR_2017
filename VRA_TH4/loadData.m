function data = loadData(strFileName, environmentName)
    tmp = load(strFileName);
    data = tmp.(environmentName);
end
