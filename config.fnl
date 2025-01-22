;; =============================================================================
;; WezTerm Configuration
;; =============================================================================

(local wezterm (require :wezterm))
(local act wezterm.action)

;; =============================================================================
;; Tab Bar Configuration
;; =============================================================================

;; -------------------------------------------------------------------------
;; Nord Color Scheme
;; -------------------------------------------------------------------------

; (local tab-bar-config {:background "#2E3440"
;                        :active_tab {:bg_color "#2E3440" :fg_color "#ECEFF4"}
;                        :inactive_tab {:bg_color "#3B4252" :fg_color "#D8DEE9"}
;                        :inactive_tab_hover {:bg_color "#4C566A"
;                                             :fg_color "#E5E9F0"
;                                             :italic true}
;                        :new_tab {:bg_color "#3B4252" :fg_color "#D8DEE9"}
;                        :new_tab_hover {:bg_color "#4C566A"
;                                        :fg_color "#E5E9F0"
;                                        :italic true}})

;; -------------------------------------------------------------------------
;; Gruvbox Color Scheme
;; -------------------------------------------------------------------------

(local tab-bar-config {:background "#282828"
                       :active_tab {:bg_color "#282828" :fg_color "#FBF1C7"}
                       :inactive_tab {:bg_color "#3C3836" :fg_color "#D5C4A1"}
                       :inactive_tab_hover {:bg_color "#665C54"
                                            :fg_color "#EBDBB2"
                                            :italic true}
                       :new_tab {:bg_color "#3C3836" :fg_color "#D5C4A1"}
                       :new_tab_hover {:bg_color "#665C54"
                                       :fg_color "#EBDBB2"
                                       :italic true}})

;; =============================================================================
;; Keybindings Configuration
;; =============================================================================

(local keybindings
       [;; -------------------------------------------------------------------------
        ;; Pane Splitting Operations
        ;; -------------------------------------------------------------------------
        {:key "h" :mods "CMD" :action wezterm.action.SplitHorizontal}
        {:key "k" :mods "CMD" :action wezterm.action.SplitVertical}
        ;; -------------------------------------------------------------------------
        ;; Pane Management
        ;; -------------------------------------------------------------------------
        {:key "d"
         :mods "CMD"
         :action (wezterm.action.CloseCurrentPane {:confirm false})}
        {:key "p" :mods "CMD" :action act.PaneSelect}
        {:key "r" :mods "CMD" :action (act.RotatePanes "Clockwise")}
        ;; -------------------------------------------------------------------------
        ;; Pane Navigation
        ;; -------------------------------------------------------------------------
        ;; Vim-style directional navigation
        {:key "m"
         ;; Left
         :mods "CMD"
         :action (act.ActivatePaneDirection "Left")}
        {:key "n"
         ;; Down
         :mods "CMD"
         :action (act.ActivatePaneDirection "Down")}
        {:key "e"
         ;; Up
         :mods "CMD"
         :action (act.ActivatePaneDirection "Up")}
        {:key "i"
         ;; Right
         :mods "CMD"
         :action (act.ActivatePaneDirection "Right")}
        ;; -------------------------------------------------------------------------
        ;; Special Keybind for Neovim
        ;; -------------------------------------------------------------------------
        {:key "Enter"
         :mods "CMD"
         :action (act.SendKey {:key "o" :mods "CTRL"})}
        {:key "n" :mods "CMD" :action (act.SendKey {:key "y" :mods "CTRL"})}
        {:key "e" :mods "CMD" :action (act.SendKey {:key "g" :mods "CTRL"})}
        {:key "i" :mods "CMD" :action (act.SendKey {:key "f" :mods "CTRL"})}
        ;; -------------------------------------------------------------------------
        ;; Pane Resizing
        ;; -------------------------------------------------------------------------
        ;; Hold Shift with navigation keys to resize
        {:key "m" :mods "CMD|SHIFT" :action (act.AdjustPaneSize ["Left" 5])}
        {:key "n" :mods "CMD|SHIFT" :action (act.AdjustPaneSize ["Down" 5])}
        {:key "e" :mods "CMD|SHIFT" :action (act.AdjustPaneSize ["Up" 5])}
        {:key "i" :mods "CMD|SHIFT" :action (act.AdjustPaneSize ["Right" 5])}
        ;; -------------------------------------------------------------------------
        ;; Window Management
        ;; -------------------------------------------------------------------------
        {:key "." :mods "CMD" :action wezterm.action.ToggleFullScreen}])

;; =============================================================================
;; Main Configuration
;; =============================================================================

(local config
       {;; -------------------------------------------------------------------------
        ;; Font Configuration
        ;; -------------------------------------------------------------------------
        :font (wezterm.font {:family "Hack Nerd Font"})
        :font_size 19.0
        :line_height 1.2
        ;; -------------------------------------------------------------------------
        ;; Window Configuration
        ;; -------------------------------------------------------------------------
        :window_padding {:bottom "0"}
        :window_decorations "RESIZE"
        :native_macos_fullscreen_mode true
        :window_close_confirmation "NeverPrompt"
        ;; -------------------------------------------------------------------------
        ;; Tab Bar Configuration
        ;; -------------------------------------------------------------------------
        :hide_tab_bar_if_only_one_tab true
        :tab_bar_at_bottom false
        :use_fancy_tab_bar true
        :colors {:tab_bar tab-bar-config}
        :window_frame {:active_titlebar_bg "#282828"
                       :inactive_titlebar_bg "#282828"
                       :font_size 16.0
                       :font (wezterm.font {:family "Hack Nerd Font"
                                            :weight :Bold})}
        ;; -------------------------------------------------------------------------
        ;; Input Configuration
        ;; -------------------------------------------------------------------------
        :send_composed_key_when_left_alt_is_pressed true
        :keys keybindings
        ;; -------------------------------------------------------------------------
        ;; Theme and Appearance
        ;; -------------------------------------------------------------------------
        :color_scheme "Gruvbox Dark (Gogh)"
        ;; -------------------------------------------------------------------------
        ;; Performance Settings
        ;; -------------------------------------------------------------------------
        :max_fps 240
        :animation_fps 240
        ;; -------------------------------------------------------------------------
        ;; Automatically Yank Selected Text
        ;; -------------------------------------------------------------------------
        :mouse_bindings [{:event {:Up {:streak 1 :button "Left"}}
                          :mods "NONE"
                          :action (wezterm.action.CompleteSelection "ClipboardAndPrimarySelection")}]
        ;; -------------------------------------------------------------------------
        ;; Miscellaneous Settings
        ;; -------------------------------------------------------------------------
        :audible_bell "Disabled"
        :inactive_pane_hsb {:saturation 1.0 :brightness 1.0}})

;; Return the final configuration
config
