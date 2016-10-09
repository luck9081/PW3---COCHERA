$(function () {
    $('.button-checkbox').each(function () {
        var $widget = $(this),
			$button = $widget.find('button'),
			$checkbox = $widget.find('input:checkbox'),
			color = $button.data('color'),
			settings = {
			    on: {
			        icon: 'glyphicon glyphicon-check'
			    },
			    off: {
			        icon: 'glyphicon glyphicon-unchecked'
			    }
			};

        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });

        $checkbox.on('change', function () {
            updateDisplay();
        });

        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');
            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
				.removeClass()
				.addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
					.removeClass('btn-default')
					.addClass('btn-' + color + ' active');
            }
            else {
                $button
					.removeClass('btn-' + color + ' active')
					.addClass('btn-default');
            }
        }
        function init() {
            updateDisplay();
            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    });

    $(document).ready(function () {

        $(".calculadora").change(function () {
            
            var date1 = new Date(document.getElementById("txtFechaInicio").value);
            var date2 = new Date(document.getElementById("txtFechaFin").value);

            var timeDiff = Math.abs(date2.getTime() - date1.getTime());

            var diffDays = Math.ceil(timeDiff / (1000 * 3600));

            

            var horaInicio = document.getElementById("txtHorarioInicio").value;
            var horaFin = document.getElementById("txtHorarioFin").value;

            horaInicio = parseInt(horaInicio.substr(0, 2));
            horaFin = parseInt(horaFin.substr(0, 2));

            var diffHoras = horaFin - horaInicio;

            document.getElementById("lblPrecioTotal").innerHTML = (diffHoras + diffDays) * (document.getElementById("precioHora").value);

            
        });

        // Activate Carousel
        $("#myCarousel").carousel();

        // Enable Carousel Indicators
        $(".item1").click(function () {
            $("#myCarousel").carousel(0);
        });
        $(".item2").click(function () {
            $("#myCarousel").carousel(1);
        });
        $(".item3").click(function () {
            $("#myCarousel").carousel(2);
        });
        $(".item4").click(function () {
            $("#myCarousel").carousel(3);
        });

        // Enable Carousel Controls
        $(".left").click(function () {
            $("#myCarousel").carousel("prev");
        });
        $(".right").click(function () {
            $("#myCarousel").carousel("next");
        });
    });
});

/*function validarRangoFecha(src, arg) {

    var date1 = new Date(document.getElementById("txtFechaInicio"));
    var date2 = new Date(document.getElementById("txtFechaInicio"));
    var timeDiff = Math.abs(date2.getTime() - date1.getTime());
    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

    arg.value = diffDays.toString();

    arg.IsValid = diffDays <= 90;
}*/