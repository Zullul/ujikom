
            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    // Gunakan sessionStorage agar timezone hanya dikirim sekali per sesi tab browser
                    if (!sessionStorage.getItem("timezone_sent")) {
                        const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
                        Livewire.dispatch("setTimezone", { timezone: timezone });
                        sessionStorage.setItem("timezone_sent", "true");
                    }
                });
            </script>
        <?php /**PATH C:\laragon\www\jurnal-pkl\storage\framework\views/d40548bddbece6a2f40d723a095d0f1a.blade.php ENDPATH**/ ?>