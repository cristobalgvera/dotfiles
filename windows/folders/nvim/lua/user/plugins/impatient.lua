local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

pcall(require, "packer_compiled")

impatient.enable_profile()
