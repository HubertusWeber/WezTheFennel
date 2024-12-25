;; =============================================================================
;; WezTerm Configuration
;; =============================================================================

(local wezterm (require :wezterm))
(local act wezterm.action)

;; =============================================================================
;; Nord Color Theme Configuration
;; =============================================================================

(local nord0 "#2E3440")

;; Polar Night (darkest)
(local nord1 "#3B4252")

;; Polar Night (darker)
(local nord3 "#4C566A")

;; Polar Night (lighter)
(local nord4 "#D8DEE9")

;; Snow Storm (darkest)
(local nord5 "#E5E9F0")

;; Snow Storm (medium)
(local nord6 "#ECEFF4")

;; Snow Storm (lightest)

;; =============================================================================
;; Tab Bar Configuration
;; =============================================================================

(local tab-bar-config {:background nord0
                       ;; Active tab appearance
                       :active_tab {:bg_color nord0 :fg_color nord6}
                       ;; Inactive tab appearance
                       :inactive_tab {:bg_color nord1 :fg_color nord4}
                       ;; Hover state for inactive tabs
                       :inactive_tab_hover {:bg_color nord3
                                            :fg_color nord5
                                            :italic true}
                       ;; New tab button appearance
                       :new_tab {:bg_color nord1 :fg_color nord4}
                       ;; Hover state for new tab button
                       :new_tab_hover {:bg_color nord3
                                       :fg_color nord5
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
        :font_size 18.0
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
        :window_frame {:active_titlebar_bg nord0
                       :inactive_titlebar_bg nord0
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
        :color_scheme "Nord (Gogh)"
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
