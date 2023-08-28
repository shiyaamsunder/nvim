return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup({
      compile_command = {
        java = { exec = "javac", args = { "-d", "bin", "$(FNAME)" } },
      },
      run_command = {
        java = { exec = "java", args = { "-cp", "bin", "$(FNOEXT)" } },
      },
      testcases_directory = "testcases",
      testcases_use_single_file = true,
    })
  end,
}
