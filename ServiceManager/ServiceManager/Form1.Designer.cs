
namespace ServiceManager
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.StartServiceBtn = new System.Windows.Forms.Button();
            this.StopServiceBtn = new System.Windows.Forms.Button();
            this.RestartServiceBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Roboto", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(24, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(114, 19);
            this.label1.TabIndex = 0;
            this.label1.Text = "Service Name :";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Roboto", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(144, 22);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 19);
            this.label2.TabIndex = 1;
            // 
            // StartServiceBtn
            // 
            this.StartServiceBtn.Location = new System.Drawing.Point(28, 88);
            this.StartServiceBtn.Name = "StartServiceBtn";
            this.StartServiceBtn.Size = new System.Drawing.Size(110, 34);
            this.StartServiceBtn.TabIndex = 2;
            this.StartServiceBtn.Text = "Start Service";
            this.StartServiceBtn.UseVisualStyleBackColor = true;
            // 
            // StopServiceBtn
            // 
            this.StopServiceBtn.Location = new System.Drawing.Point(28, 88);
            this.StopServiceBtn.Name = "StopServiceBtn";
            this.StopServiceBtn.Size = new System.Drawing.Size(110, 34);
            this.StopServiceBtn.TabIndex = 4;
            this.StopServiceBtn.Text = "Stop Service";
            this.StopServiceBtn.UseVisualStyleBackColor = true;
            // 
            // RestartServiceBtn
            // 
            this.RestartServiceBtn.Location = new System.Drawing.Point(196, 88);
            this.RestartServiceBtn.Name = "RestartServiceBtn";
            this.RestartServiceBtn.Size = new System.Drawing.Size(110, 34);
            this.RestartServiceBtn.TabIndex = 5;
            this.RestartServiceBtn.Text = "Restart Service";
            this.RestartServiceBtn.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(347, 201);
            this.Controls.Add(this.RestartServiceBtn);
            this.Controls.Add(this.StopServiceBtn);
            this.Controls.Add(this.StartServiceBtn);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.Text = "Service Manager";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button StartServiceBtn;
        private System.Windows.Forms.Button StopServiceBtn;
        private System.Windows.Forms.Button RestartServiceBtn;
    }
}

