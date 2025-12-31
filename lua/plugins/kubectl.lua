---@diagnostic disable: missing-parameter, missing-fields

return {
  {
    "ramilito/kubectl.nvim",
    version = "2.*",
    dependencies = "saghen/blink.download",
	  -- stylua: ignore
    keys = {
      { "<leader>k", mode = "n", function() require("kubectl").toggle() end, desc = "Toggle kubectl", { noremap = true, silent = true }},
    },
    -- stylua: ignore 
    config = function()
      require("kubectl").setup({
        logs = {
          prefix = false,
          timestamps = false,
          since = "1h",
        },
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "k8s_*",
        callback = function(ev)
          local k = vim.keymap
          local opts = { buffer = ev.buf }
          k.set("n", "7", "<Plug>(kubectl.view_overview)", opts)
        end,
      })
      goto skip
      -- Documentation
      local group = vim.api.nvim_create_augroup("kubectl_mappings", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "k8s_*",
        callback = function(ev)
          local k = vim.keymap.set
          local opts = { buffer = ev.buf }

          -- Global
          k("n", "g?", "<Plug>(kubectl.help)", opts) -- Help float
          k("n", "gr", "<Plug>(kubectl.refresh)", opts) -- Refresh view
          k("n", "gs", "<Plug>(kubectl.sort)", opts) -- Sort by column
          k("n", "gD", "<Plug>(kubectl.delete)", opts) -- Delete resource
          k("n", "gd", "<Plug>(kubectl.describe)", opts) -- Describe resource
          k("n", "gy", "<Plug>(kubectl.yaml)", opts) -- View yaml
          k("n", "ge", "<Plug>(kubectl.edit)", opts) -- Edit resource
          k("n", "<C-l>", "<Plug>(kubectl.filter_label)", opts) -- Filter labels
          k("n", "<BS>", "<Plug>(kubectl.go_up)", opts) -- Go back to previous view
          k("v", "<C-f>", "<Plug>(kubectl.filter_term)", opts) -- Filter selected text
          k("n", "<CR>", "<Plug>(kubectl.select)", opts) -- Resource select action (different on each view)
          k("n", "<Tab>", "<Plug>(kubectl.tab)", opts) -- Select resource
          k("n", "<S-Tab>", "<Plug>(kubectl.clear_selection)", opts) -- Clear selection
          k("n", "", "<Plug>(kubectl.quit)", opts) -- Close view (when applicable)
          k("n", "gk", "<Plug>(kubectl.kill)", opts) -- Pod/portforward kill
          k("n", "<M-h>", "<Plug>(kubectl.toggle_headers)", opts) -- Toggle headers
          k("n", "<f4>", "<Plug>(kubectl.toggle_fullscreen)", opts) -- Toggle fullscreen

          -- Views
          k("n", "<C-p>", "<Plug>(kubectl.picker_view)", opts) -- Picker view
          k("n", "<C-a>", "<Plug>(kubectl.alias_view)", opts) -- Aliases view
          k("n", "<C-x>", "<Plug>(kubectl.contexts_view)", opts) -- Contexts view
          k("n", "<C-f>", "<Plug>(kubectl.filter_view)", opts) -- Filter view
          k("n", "<C-n>", "<Plug>(kubectl.namespace_view)", opts) -- Namespaces view
          k("n", "gP", "<Plug>(kubectl.portforwards_view)", opts) -- Portforwards view

          -- views
          k("n", "1", "<Plug>(kubectl.view_deployments)", opts) -- Deployments view
          k("n", "2", "<Plug>(kubectl.view_pods)", opts) -- Pods view
          k("n", "3", "<Plug>(kubectl.view_configmaps)", opts) -- ConfigMaps view
          k("n", "4", "<Plug>(kubectl.view_secrets)", opts) -- Secrets view
          k("n", "5", "<Plug>(kubectl.view_services)", opts) -- Services view
          k("n", "6", "<Plug>(kubectl.view_ingresses)", opts) -- Ingresses view
          k("n", "", "<Plug>(kubectl.view_api_resources)", opts) -- API-Resources view
          k("n", "", "<Plug>(kubectl.view_clusterrolebinding)", opts) -- ClusterRoleBindings view
          k("n", "", "<Plug>(kubectl.view_crds)", opts) -- CRDs view
          k("n", "", "<Plug>(kubectl.view_cronjobs)", opts) -- CronJobs view
          k("n", "", "<Plug>(kubectl.view_daemonsets)", opts) -- DaemonSets view
          k("n", "", "<Plug>(kubectl.view_events)", opts) -- Events view
          k("n", "", "<Plug>(kubectl.view_helm)", opts) -- Helm view
          k("n", "", "<Plug>(kubectl.view_horizontalpodautoscalers)", opts) -- HorizontalPodAutoscalers view
          k("n", "", "<Plug>(kubectl.view_jobs)", opts) -- Jobs view
          k("n", "", "<Plug>(kubectl.view_nodes)", opts) -- Nodes view
          k("n", "7", "<Plug>(kubectl.view_overview)", opts) -- Overview view
          k("n", "", "<Plug>(kubectl.view_persistentvolumes)", opts) -- PersistentVolumes view
          k("n", "", "<Plug>(kubectl.view_persistentvolumeclaims)", opts) -- PersistentVolumeClaims view
          k("n", "", "<Plug>(kubectl.view_replicasets)", opts) -- ReplicaSets view,
          k("n", "", "<Plug>(kubectl.view_serviceaccounts)", opts) -- ServiceAccounts view
          k("n", "", "<Plug>(kubectl.view_statefulsets)", opts) -- StatefulSets view
          k("n", "", "<Plug>(kubectl.view_storageclasses)", opts) -- StorageClasses view
          k("n", "", "<Plug>(kubectl.view_top_nodes)", opts) -- Top view for nodes
          k("n", "", "<Plug>(kubectl.view_top_pods)", opts) -- Top view for pods

          -- Deployment/DaemonSet actions
          k("n", "grr", "<Plug>(kubectl.rollout_restart)", opts) -- Rollout restart
          k("n", "gss", "<Plug>(kubectl.scale)", opts) -- Scale workload
          k("n", "gi", "<Plug>(kubectl.set_image)", opts) -- Set image (only if 1 container)

          -- Pod/Container logs
          k("n", "gl", "<Plug>(kubectl.logs)", opts) -- Logs view
          k("n", "gh", "<Plug>(kubectl.history)", opts) -- Change logs --since= flag
          k("n", "f", "<Plug>(kubectl.follow)", opts) -- Follow logs
          k("n", "gw", "<Plug>(kubectl.wrap)", opts) -- Toggle wrap log lines
          k("n", "gp", "<Plug>(kubectl.prefix)", opts) -- Toggle container name prefix
          k("n", "gt", "<Plug>(kubectl.timestamps)", opts) -- Toggle timestamps prefix
          k("n", "gpp", "<Plug>(kubectl.previous_logs)", opts) -- Toggle show previous logs

          -- Node actions
          k("n", "gC", "<Plug>(kubectl.cordon)", opts) -- Cordon node
          k("n", "gU", "<Plug>(kubectl.uncordon)", opts) -- Uncordon node
          k("n", "gR", "<Plug>(kubectl.drain)", opts) -- Drain node

          -- Top actions
          k("n", "gn", "<Plug>(kubectl.top_nodes)", opts) -- Top nodes
          k("n", "gp", "<Plug>(kubectl.top_pods)", opts) -- Top pods

          -- CronJob actions
          k("n", "gss", "<Plug>(kubectl.suspend_cronjob)", opts) -- Suspend CronJob
          k("n", "gc", "<Plug>(kubectl.create_job)", opts) -- Create Job from CronJob

          k("n", "gp", "<Plug>(kubectl.portforward)", opts) -- Pods/Services portforward
          k("n", "gx", "<Plug>(kubectl.browse)", opts) -- Ingress view
          k("n", "gy", "<Plug>(kubectl.yaml)", opts) -- Helm view
        end,
      })
      ::skip::
    end,
  },
}
